local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

-- Función para obtener el nombre del archivo sin extensión
local function get_filename()
    return function(_, snip)
        local filename = snip.env.TM_FILENAME or "Sin título"
        return filename:gsub("%.md$", "") -- Quita la extensión .md si existe
    end
end

ls.add_snippets("markdown", {
    s("onote", fmt([[
# {}

📅 Fecha: {}
🏷️ Etiquetas: {}

---

## 📌 Idea principal

{}

---

## 📝 Descripción

---

## 🔗 Notas relacionadas
    ]], {
        f(get_filename()),  -- Usa el nombre del archivo como título
        f(function() return os.date("%Y-%m-%d") end), -- Fecha actual automática
        i(1, "Tags"), -- Cursor en etiquetas al lanzar el snippet
        i(2, "Idea") -- Cursor en etiquetas al lanzar el snippet
    }))
})

ls.add_snippets("markdown", {
    s("oindex", fmt([[
# {}

📅 Fecha: {}
🏷️ Etiquetas: {}
🛠 Objetivo: {}

---

## 🔗 Notas relacionadas
    ]], {
        f(get_filename()),  -- Usa el nombre del archivo como título
        f(function() return os.date("%Y-%m-%d") end), -- Fecha actual automática
        i(1, "Tags"), -- Cursor en etiquetas al lanzar el snippet
        i(2, "Objetivo") -- Cursor en etiquetas al lanzar el snippet
    }))
})

ls.add_snippets("markdown", {
    s("oinbox", fmt([[
# {}

📅 Fecha: {}
🛠 Objetivo: {}

---

## 📌 Introducción
{}
    ]], {
        f(get_filename()),  -- Usa el nombre del archivo como título
        f(function() return os.date("%Y-%m-%d") end), -- Fecha actual automática
        i(1, "Objetivo"), -- Cursor en etiquetas al lanzar el snippet
        i(2, "Contenido") -- Cursor en etiquetas al lanzar el snippet
    }))
})

ls.add_snippets("markdown", {
    s("oreference", fmt([[
# {}

📅 Fecha: {}

---

## 📌 Fragmento
{}

---

## 📜 Referencia
{}

    ]], {
        f(get_filename()),  -- Usa el nombre del archivo como título
        f(function() return os.date("%Y-%m-%d") end), -- Fecha actual automática
        i(1, "Fragmento"), -- Cursor en etiquetas al lanzar el snippet
        i(2, "Referencia") -- Cursor en etiquetas al lanzar el snippet
    }))
})

