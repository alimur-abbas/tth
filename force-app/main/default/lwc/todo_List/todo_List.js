import { LightningElement, track } from 'lwc';

export default class Todo_List extends LightningElement {
    @track todoList = [];
    @track done=false;
    @track doneList= [];
    handleAddTodo(event){
        var tododemo =this.template.querySelector('.validate');
        var todo = tododemo.value.toUpperCase();
        console.log(todo);
        if(this.todoList.indexOf(todo) !== -1){
            tododemo.setCustomValidity('Task already exists');
            tododemo.reportValidity();
        }
        else if(todo != ''){
        this.todoList.push(todo);
        console.log(this.todoList[0]); 
        }else{
            //tododemo.setCustomValidity('Please Enter Todo.');
            tododemo.reportValidity();
        }
        this.template.querySelector('.validate').value = '';

    }
    handleDone(event){
        this.done = true;
        var todo = event.target.value;
        this.doneList.push(todo);
        this.todoList.shift(todo);

    }
}