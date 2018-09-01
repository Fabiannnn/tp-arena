package transformer

import org.uqbar.arena.bindings.ValueTransformer
import eventos.TipoDeUsuario

class TipoDeUsuarioTransformer implements ValueTransformer<TipoDeUsuario, String>{
	
	override getModelType() {
		TipoDeUsuario
	}
	
	override getViewType() {
		String
	}
	
	override modelToView(TipoDeUsuario valueFromModel) {
//		if(valueFromModel == "UsuarioFree" ){
//		return " No tan Free"
//		} else if (valueFromModel == UsuarioAmateur){
//		return "Amateur"
//		} else 
//		if (valueFromModel){
//			return true	}
}
	
	override viewToModel(String valueFromView) {
	
	}
	
	}