import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector
import matplotlib.pyplot as plt

# Database connection function
def db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="currency_tracker"
    )

# Fetch exchange rate from the database
def get_exchange_rate(base_currency, target_currency):
    conn = db_connection()
    cursor = conn.cursor()
    query = "SELECT exchange_rate FROM exchange_rates WHERE base_currency=%s AND target_currency=%s"
    cursor.execute(query, (base_currency, target_currency))
    result = cursor.fetchone()
    conn.close()
    return result[0] if result else None

# Update exchange rate in the database
def update_exchange_rate(base_currency, target_currency, new_rate):
    conn = db_connection()
    cursor = conn.cursor()
    query = "UPDATE exchange_rates SET exchange_rate=%s WHERE base_currency=%s AND target_currency=%s"
    cursor.execute(query, (new_rate, base_currency, target_currency))
    conn.commit()
    conn.close()

# Fetch historical exchange rate data
def fetch_historical_data(base_currency, target_currency):
    conn = db_connection()
    cursor = conn.cursor()
    query = "SELECT last_updated, exchange_rate FROM exchange_rates WHERE base_currency=%s AND target_currency=%s ORDER BY last_updated ASC"
    cursor.execute(query, (base_currency, target_currency))
    data = cursor.fetchall()
    conn.close()
    return data

# Currency conversion function
def convert_currency():
    base_currency = base_currency_var.get()
    target_currency = target_currency_var.get()
    amount = amount_var.get()
    
    rate = get_exchange_rate(base_currency, target_currency)
    
    if rate:
        converted_amount = round(amount * rate, 2)
        converted_amount_var.set(f"{converted_amount} {target_currency}")
    else:
        messagebox.showerror("Error", "Exchange rate not available!")

# Function to update exchange rate
def update_exchange():
    base_currency = base_currency_var.get()
    target_currency = target_currency_var.get()
    try:
        new_rate = float(new_rate_var.get())
        update_exchange_rate(base_currency, target_currency, new_rate)
        messagebox.showinfo("Success", "Exchange rate updated!")
    except ValueError:
        messagebox.showerror("Error", "Invalid rate value!")

# Function to plot exchange rate trends
def plot_trend():
    base_currency = base_currency_var.get()
    target_currency = target_currency_var.get()
    data = fetch_historical_data(base_currency, target_currency)
    
    if data:
        dates = [d[0] for d in data]
        rates = [d[1] for d in data]
        
        plt.figure(figsize=(10, 5))
        plt.plot(dates, rates, marker="o", linestyle="-")
        plt.title(f"Exchange Rate Trend: {base_currency} to {target_currency}")
        plt.xlabel("Date")
        plt.ylabel("Exchange Rate")
        plt.grid(True)
        plt.xticks(rotation=45)
        plt.show()
    else:
        messagebox.showinfo("No Data", "No historical data available!")

# Tkinter GUI Setup
root = tk.Tk()
root.title("Currency Exchange Rate Tracker")
root.geometry("400x500")

currencies = ["USD", "EUR", "INR", "GBP"]
base_currency_var = tk.StringVar(value="USD")
target_currency_var = tk.StringVar(value="INR")
amount_var = tk.DoubleVar(value=1.0)
converted_amount_var = tk.StringVar(value="")
new_rate_var = tk.StringVar()

# GUI Layout
ttk.Label(root, text="Base Currency").pack()
ttk.Combobox(root, textvariable=base_currency_var, values=currencies).pack()

ttk.Label(root, text="Target Currency").pack()
ttk.Combobox(root, textvariable=target_currency_var, values=currencies).pack()

ttk.Label(root, text="Amount").pack()
tk.Entry(root, textvariable=amount_var).pack()

tk.Button(root, text="Convert", command=convert_currency).pack()
ttk.Label(root, text="Converted Amount").pack()
tk.Entry(root, textvariable=converted_amount_var, state="readonly").pack()

# Update Exchange Rate Section
ttk.Label(root, text="New Exchange Rate").pack()
tk.Entry(root, textvariable=new_rate_var).pack()
tk.Button(root, text="Update Rate", command=update_exchange).pack()

# Trend Graph Button
tk.Button(root, text="Show Trend", command=plot_trend).pack()

# Start the GUI
root.mainloop()
