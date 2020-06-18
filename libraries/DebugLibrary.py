import os
import pprint
from robot.libraries.BuiltIn import BuiltIn

class DebugLibrary:

    def print_envs(self):
        for k, v in os.environ.items():
            print(f'*DEBUG*{k}={v}')

    def pause_on_failure(self):
        has_failed = BuiltIn().get_variable_value("${SUITE_STATUS}") == 'FAIL'
        if self.__is_debug_mode and has_failed:
            BuiltIn().run_keyword("Pause Execution", "Paused due to task failure, click OK to continue teardown")

    def pause_for_debug(self):
        if self.__is_debug_mode:
            BuiltIn().run_keyword("Pause Execution", "Paused execution for debugging, click OK to continu process")

    def set_breakpoint(self):
        if self.__is_debug_mode():
            import sys, pdb; pdb.Pdb(stdout=sys.__stdout__).set_trace()

    def show_variables(self):
        # TODO: Recursively dump the NormalizedDict and optionally hide secrets
        variables = {k: v for k, v in BuiltIn().get_variables().items()}
        pprint.pprint(variables)

    
    def __is_debug_mode(self):
        return os.environ['ROBOT_DEBUG'] == 'TRUE'
