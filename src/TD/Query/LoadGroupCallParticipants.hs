{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.LoadGroupCallParticipants where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Loads more participants of a group call. The loaded participants will be received through updates. Use the field groupCall.loaded_all_participants to check whether all participants have already been loaded
data LoadGroupCallParticipants = LoadGroupCallParticipants
  { -- | The maximum number of participants to load; up to 100
    limit :: Maybe Int,
    -- | Group call identifier. The group call must be previously received through getGroupCall and must be joined or being joined
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show LoadGroupCallParticipants where
  show
    LoadGroupCallParticipants
      { limit = limit_,
        group_call_id = group_call_id_
      } =
      "LoadGroupCallParticipants"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON LoadGroupCallParticipants where
  toJSON
    LoadGroupCallParticipants
      { limit = limit_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "loadGroupCallParticipants",
          "limit" A..= limit_,
          "group_call_id" A..= group_call_id_
        ]
