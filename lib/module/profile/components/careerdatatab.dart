import 'package:f2fbuu/module/profile/bloc/profile_bloc.dart';
import 'package:f2fbuu/module/profile/components/attentiondatatab.dart';
import 'package:f2fbuu/module/profile/components/workdatatab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/response/api_profile.dart';

class ProfileCareerDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;
  ProfileCareerDataHead({Key? key, required this.dataFromAPI}) : super(key: key);

  @override
  State<ProfileCareerDataHead> createState() => _ProfileCareerDataHeadState();
}

////////////////////////////////////////////////////////////////////////////////
class _ProfileCareerDataHeadState extends State<ProfileCareerDataHead> {
  bool isUnpressed = true;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    var dataFromAPI = widget.dataFromAPI;
    String attentionValue ="";
    String statusValue ="";
    String workplaceValue ="";
    String jobTypeValue ="";
    String careerValue ="";
    String companyValue ="";
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: Colors.black12),
                bottom: BorderSide(width: 1, color: Colors.transparent)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  '${dataFromAPI?.body?.screeninfo?.textcareer}',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isUnpressed = !isUnpressed;
                          if(isUnpressed == true){
                            context.read<ProfileBloc>().add(CareerSubmitEvent(jobType: jobTypeValue, company: companyValue, status: statusValue, attention: attentionValue, career: careerValue, workplace: workplaceValue));
                          };
                        });
                      },
                      child: isUnpressed
                          ? Text('แก้ไข', style: TextStyle(color: Colors.red))
                          : Text('บันทึก',
                              style: TextStyle(color: Colors.green)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ProfileAttentionDropdownTab(
          attentionArray: dataFromAPI?.body?.profileCareerScreeninfo?.attention??[],
          userAttentionValue: dataFromAPI?.body?.profileCareerInfo?.userattention??"",
          textLeft: '${dataFromAPI?.body?.screeninfo?.textatt}',
          isUnpressed: isUnpressed,
          callbackFromAttentionDataTab: (String attentionResult){
            setState((){
              attentionValue = attentionResult;
              print(attentionValue);
            });
          },
        ),
        ProfileCareerDropdownTab(
          textLeft: '${dataFromAPI?.body?.screeninfo?.textstatus}',
          statusArray: dataFromAPI?.body?.profileCareerScreeninfo?.status??[],
          userStatusValue: dataFromAPI?.body?.profileCareerInfo?.userstatus??"",
          jobTextLeft: '${dataFromAPI?.body?.screeninfo?.textjobtype}',
          jobTypeArray: dataFromAPI?.body?.profileCareerScreeninfo?.jobtype??[],
          userJobValue: dataFromAPI?.body?.profileCareerInfo?.userjobtype??"",
          subtitleWorkplace: '${dataFromAPI?.body?.screeninfo?.subtitleworkplace}',
          userWorkplace: dataFromAPI?.body?.profileCareerInfo?.userworkplace??"",
          userCareer: dataFromAPI?.body?.profileCareerInfo?.usercareer??"",
          userCompany: dataFromAPI?.body?.profileCareerInfo?.usercompany??"",
          textComp: '${dataFromAPI?.body?.screeninfo?.textcomp}',
          textCareer: '${dataFromAPI?.body?.screeninfo?.textcareer}',
          isUnpressed: isUnpressed,
          callbackFromWorkDataTab: (String jobType, String workplace, String career, String company){
            setState((){
              jobTypeValue = jobType;
              workplaceValue = workplace;
              careerValue = career;
              companyValue = company;
              print(jobType + "และ" +  workplace + "และ" + career + "และ" + company);
            });
          },
          callbackFromWorkDataTabStatus: (String status){
            setState((){
              statusValue = status;
              print(statusValue);
            });
          },
        ),
      ],
    );
  }
}
