<?php

namespace App\Http\Controllers;

use App\Models\Group;
use App\User;
use Illuminate\Http\Request;

class GroupController extends Controller
{
    public function index()
    {
        return view('groups.index', [
            'groups' => Group::query()->paginate(15),
        ]);
    }

    public function create()
    {
        return view('groups.form', ['group' => null]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255', 'unique:groups,name'],
        ]);

        Group::create($validated);

        return redirect()->route('admin.groups.index')->withStatus(__('Group successfully created.'));
    }

    public function edit(Group $group)
    {
        return view('groups.form', ['group' => $group]);
    }

    public function update(Request $request, Group $group)
    {

        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255', 'unique:groups,name,'.$group->id],
        ]);
        $groupName = $group->name;

        $group->update($validated);

        User::where('restaurant_group', $groupName)->update(['restaurant_group' => $group->name]);

        return redirect()->route('admin.groups.index')->withStatus(__('Group successfully updated.'));
    }

    public function destroy(Group $group)
    {
        $groupName = $group->name;
        $group->delete();

        User::where('restaurant_group', $groupName)->update(['restaurant_group' => null]);

        return redirect()->route('admin.groups.index')->withStatus(__('Group successfully deleted.'));
    }
}
