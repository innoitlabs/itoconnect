import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i2connect/data/bloc/voters_data/voters_data_cubit.dart';
import 'package:i2connect/model/voters_data/voters_data_model.dart';

class SearchVoterView extends StatefulWidget {
  const SearchVoterView({Key? key}) : super(key: key);

  @override
  State<SearchVoterView> createState() => _SearchVoterViewState();
}

class _SearchVoterViewState extends State<SearchVoterView> {
  final searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 40.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: searchTextController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Voter ID Number',
                    hintStyle: TextStyle(
                      color: Color(0xFFAEAEAE),
                      fontFamily: "ProximaNova",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding:
                        EdgeInsets.only(top: 0.0, left: 14.0, bottom: 10.0),
                    suffix: Icon(Icons.arrow_drop_down),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF0047B2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF0047B2),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    BlocProvider.of<VotersDataCubit>(context)
                        .searchVoter(value);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocConsumer<VotersDataCubit, VotersDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.searchVoterData.voterId != null) {
            final votersData = state.searchVoterData;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        votersData.voterId ?? '',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontFamily: "ProximaNova",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const Divider(
                  height: 1.0,
                  thickness: 1.0,
                  color: Color(0xFFCCD0D6),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'First name',
                                  style: TextStyle(
                                    color: Color(0xFF606B83),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  votersData.firstName ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF263659),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Last name',
                                  style: TextStyle(
                                    color: Color(0xFF606B83),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  votersData.lastName ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF263659),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Designation',
                                  style: TextStyle(
                                    color: Color(0xFF606B83),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  votersData.designation ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF263659),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Gender',
                                  style: TextStyle(
                                    color: Color(0xFF606B83),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  votersData.gender ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF263659),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Caste',
                                  style: TextStyle(
                                    color: Color(0xFF606B83),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  votersData.subCaste?.toString() ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF263659),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Phone',
                                  style: TextStyle(
                                    color: Color(0xFF606B83),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  votersData.phoneNo?.toString() ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF263659),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Email',
                                  style: TextStyle(
                                    color: Color(0xFF606B83),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  votersData.emailId ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF263659),
                                    fontFamily: "ProximaNova",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14.0),
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
