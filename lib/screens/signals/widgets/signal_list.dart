import 'package:flutter/material.dart';

import '../../../core/models/signal_view_model.dart';
import '../../../core/models/user_subscription.dart';
import '../../../core/models/signal_model.dart';
import '../../../core/repository/repository_provider.dart';

import 'signal_card.dart';

class SignalList extends StatefulWidget {
  const SignalList({
    super.key,
    required this.subscription,
    this.search = '',
    this.category,
  });

  final UserSubscription subscription;
  final String search;
  final MarketCategory? category;

  @override
  State<SignalList> createState() => _SignalListState();
}

class _SignalListState extends State<SignalList> {
  late Future<List<SignalViewModel>> _future;

  @override
  void initState() {
    super.initState();
    _loadSignals();
  }

  @override
  void didUpdateWidget(covariant SignalList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.search != widget.search ||
        oldWidget.subscription != widget.subscription ||
        oldWidget.category != widget.category) {
      _loadSignals();
    }
  }

  void _loadSignals() {
    _future = RepositoryProvider.signalRepository.getSignals(
      subscription: widget.subscription,
      category: widget.category,
      search: widget.search,
    );
  }

  Future<void> _refresh() async {
    setState(() {
      _loadSignals();
    });

    await _future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SignalViewModel>>(
      future: _future,
      builder: (context, snapshot) {
                //----------------------------------------------------
        // LOADING
        //----------------------------------------------------

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        //----------------------------------------------------
        // ERROR
        //----------------------------------------------------

        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 52,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Signals could not be loaded.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    snapshot.error.toString(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _refresh,
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            ),
          );
        }

        final signals = snapshot.data ?? [];

        //----------------------------------------------------
        // EMPTY
        //----------------------------------------------------

        if (signals.isEmpty) {
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              children: const [
                SizedBox(height: 180),
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 60,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No signals found.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        //----------------------------------------------------
        // LIST
        //----------------------------------------------------

        return RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            itemCount: signals.length,
            itemBuilder: (context, index) {
              final signal = signals[index];
                            return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SignalCard(
                  viewModel: signal,
                ),
              );
            },
          ),
        );
      },
    );
  }
}