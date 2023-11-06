for c in ("ABCDEFGHIJKLMNOPQRTSUVWXYZ0123456789"):gmatch"." do
    data.raw["virtual-signal"]["signal-" .. c].icon = "__large-print-signals__/graphics/icons/signal/signal_" .. c .. ".png"
end

