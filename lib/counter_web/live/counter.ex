defmodule CounterWeb.CounterLive do
  use CounterWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
      socket
      |> assign(:count, 0)
      |> assign(:reset_value, 0)}
  end

 def render(assigns) do
  ~H"""
  <div class="flex flex-col items-center justify-center min-h-screen bg-gray-100">
    <h1 class="text-4xl font-bold mb-6 text-gray-800">
      Counter: <%= @count %>
    </h1>

    <div class="flex space-x-4 mb-6">
      <button
        phx-click="dec"
        class="px-6 py-2 bg-red-500 hover:bg-red-600 text-white font-semibold rounded-lg shadow-md transition"
      >
        -
      </button>

      <button
        phx-click="inc"
        class="px-6 py-2 bg-green-500 hover:bg-green-600 text-white font-semibold rounded-lg shadow-md transition"
      >
        +
      </button>
    </div>

    <.form
      for={%{}}
      id="reset-form"
      phx-submit="submit"
      class="flex space-x-2"
    >
      <input
        type="number"
        name="reset_value"
        value={@reset_value}
        placeholder="Reset to"
        required
        class="w-32 px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400 bg-white text-gray-800"
      />
      <button
        type="submit"
        class="px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white rounded-lg shadow transition"
      >
        Submit
      </button>
    </.form>
  </div>
  """
end


  def handle_event("inc", _params, socket) do
    {:noreply, assign(socket, :count, socket.assigns.count + 1)}
  end

  def handle_event("dec", _params, socket) do
    cond do
      socket.assigns.count <= 0 ->
        {:noreply, assign(socket, :count, 0)}
     socket.assigns.count > 0 ->
        {:noreply, assign(socket, :count, socket.assigns.count - 1)}
        put_flash(socket, :error, "Count cannot go below zero")
      true ->
        :ok
    end
  end

  def handle_event("submit", %{"reset_value" => val}, socket) do
    {number,_} = Integer.parse(val)
    case number do
      num when num < 0 ->
        {:noreply, put_flash(socket, :error, "Reset value cannot be negative")}
        {:noreply, assign(socket, count: 0, reset_value: 0)}
      num when num > 0 ->
        {:noreply, assign(socket, count: num, reset_value: num)}
      _ ->
        {:noreply, put_flash(socket, :error, "Invalid reset value")}
    end
  end
end
