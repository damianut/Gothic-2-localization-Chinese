///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest()
{
	AI_Output(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //教 我 那 种 语 言 。
};

func void B_DIA_Addon_Myxir_TeachL1()
{
	AI_Output(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //我 们 从 容 易 一 点 的 开 始 。 首 先 ， 我 能 教 你 农 民 的 语 言 。
	AI_Output(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //作 为 一 种 规 则 ， 使 用 农 民 的 语 言 书 写 的 文 字 记 录 了 世 俗 的 事 件 ， 例 如 工 作 、 爱 情 或 者 获 得 食 物 。
	AI_Output(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //它 是 一 种 城 市 中 的 普 通 的 语 言 。 如 果 你 了 解 了 它 ， 那 么 就 能 看 懂 在 这 里 找 到 的 大 部 分 文 字 。
};

func void B_DIA_Addon_Myxir_TeachL2()
{
	AI_Output(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //你 已 经 学 会 了 农 民 的 语 言 。 战 士 的 语 言 稍 微 难 一 些 。
	AI_Output(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //使 用 战 士 的 语 言 书 写 的 文 字 大 多 记 录 的 是 武 器 和 战 争 。 你 能 从 其 中 学 到 一 些 有 用 的 东 西 。
};

func void B_DIA_Addon_Myxir_TeachL3()
{
	AI_Output(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //高 级 的 牧 师 的 语 言 真 的 十 分 难 以 理 解 ， 但 是 我 很 乐 意 教 你 。
	AI_Output(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //特 别 是 ， 解 释 历 史 和 创 造 者 的 魔 法 使 用 的 神 圣 铭 文 ， 都 是 用 牧 师 的 语 言 书 写 的 。
	AI_Output(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //如 果 你 能 理 解 它 们 的 含 义 的 话 ， 这 些 文 字 记 录 每 种 都 是 真 正 的 宝 藏 。
};

func void B_DIA_Addon_Myxir_TeachNoMore()
{
	AI_Output(self, other, "DIA_Addon_Myxir_TeachNoMore_12_00"); //我 没 有 再 能 教 你 的 了 。 你 现 在 已 经 掌 握 了 一 份 建 造 者 的 语 言 。
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X()
{
	AI_Output(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //去 实 践 你 的 新 知 识 吧 。 你 会 发 现 建 造 者 的 铭 文 对 你 而 言 不 再 是 无 法 理 解 的 秘 密 。
};
