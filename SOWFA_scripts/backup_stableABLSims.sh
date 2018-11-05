#!/bin/bash

rsync -av --no-links /scratch/mlawson/wakeSteeringSims.hold/infPer_0.001m_5m /projects/windsim/mlawson/wake_steering/stableABLRuns/ > infPer_0.001m_5m.log &
rsync -av --no-links /scratch/mlawson/wakeSteeringSims.hold/infPer_0.15m_5m /projects/windsim/mlawson/wake_steering/stableABLRuns/ > infPer_0.15m_5m.log &
rsync -av --no-links /scratch/mlawson/wakeSteeringSims.hold/24HrPer_0.001m_5m /projects/windsim/mlawson/wake_steering/stableABLRuns/ > 24HrPer_0.001m_5m.log &
rsync -av --no-links /scratch/mlawson/wakeSteeringSims.hold/24HrPer_0.15m_5m /projects/windsim/mlawson/wake_steering/stableABLRuns/ > 24HrPer_0.15m_5m.log &
rsync -av --no-links /scratch/mlawson/wakeSteeringSims.hold/48HrPer_0.001m_5m /projects/windsim/mlawson/wake_steering/stableABLRuns/ > 48HrPer_0.001m_5m.log &
rsync -av --no-links /scratch/mlawson/wakeSteeringSims.hold/48HrPer_0.15m_5m /projects/windsim/mlawson/wake_steering/stableABLRuns/ > 48HrPer_0.15m_5m.log &
