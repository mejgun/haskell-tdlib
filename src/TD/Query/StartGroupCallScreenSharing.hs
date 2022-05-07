{-# LANGUAGE OverloadedStrings #-}

module TD.Query.StartGroupCallScreenSharing where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Starts screen sharing in a joined group call. Returns join response payload for tgcalls
data StartGroupCallScreenSharing = StartGroupCallScreenSharing
  { -- | Group call join payload; received from tgcalls
    payload :: Maybe String,
    -- | Screen sharing audio channel synchronization source identifier; received from tgcalls
    audio_source_id :: Maybe Int,
    -- | Group call identifier
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show StartGroupCallScreenSharing where
  show
    StartGroupCallScreenSharing
      { payload = payload,
        audio_source_id = audio_source_id,
        group_call_id = group_call_id
      } =
      "StartGroupCallScreenSharing"
        ++ U.cc
          [ U.p "payload" payload,
            U.p "audio_source_id" audio_source_id,
            U.p "group_call_id" group_call_id
          ]

instance T.ToJSON StartGroupCallScreenSharing where
  toJSON
    StartGroupCallScreenSharing
      { payload = payload,
        audio_source_id = audio_source_id,
        group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "startGroupCallScreenSharing",
          "payload" A..= payload,
          "audio_source_id" A..= audio_source_id,
          "group_call_id" A..= group_call_id
        ]
