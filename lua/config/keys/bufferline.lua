return {
	{ "<leader>b", "", desc = "Buffer (Bufferline)" },
	{ "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick buffer", noremap = false },
	{ "<leader>bc", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers", noremap = false },
	{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to the left", noremap = false },
	{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to the right", noremap = false },
	{ "<leader>be", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by extension", noremap = false },
	{ "<leader>bd", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory", noremap = false },
	{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer", noremap = false },
	{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer", noremap = false },
}
