package core

type MagicTheGatheringTwoError struct {
	IsMagicTheGatheringTwoError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewMagicTheGatheringTwoError(code string, msg string, ctx *Context) *MagicTheGatheringTwoError {
	return &MagicTheGatheringTwoError{
		IsMagicTheGatheringTwoError: true,
		Sdk:              "MagicTheGatheringTwo",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *MagicTheGatheringTwoError) Error() string {
	return e.Msg
}
