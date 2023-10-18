module TD.Query.LoadGroupCallParticipants
  (LoadGroupCallParticipants(..)
  , defaultLoadGroupCallParticipants
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Loads more participants of a group call. The loaded participants will be received through updates. Use the field groupCall.loaded_all_participants to check whether all participants have already been loaded. Returns 'TD.Data.Ok.Ok'
data LoadGroupCallParticipants
  = LoadGroupCallParticipants
    { group_call_id :: Maybe Int -- ^ Group call identifier. The group call must be previously received through getGroupCall and must be joined or being joined
    , limit         :: Maybe Int -- ^ The maximum number of participants to load; up to 100
    }
  deriving (Eq, Show)

instance I.ShortShow LoadGroupCallParticipants where
  shortShow
    LoadGroupCallParticipants
      { group_call_id = group_call_id_
      , limit         = limit_
      }
        = "LoadGroupCallParticipants"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "limit"         `I.p` limit_
          ]

instance AT.ToJSON LoadGroupCallParticipants where
  toJSON
    LoadGroupCallParticipants
      { group_call_id = group_call_id_
      , limit         = limit_
      }
        = A.object
          [ "@type"         A..= AT.String "loadGroupCallParticipants"
          , "group_call_id" A..= group_call_id_
          , "limit"         A..= limit_
          ]

defaultLoadGroupCallParticipants :: LoadGroupCallParticipants
defaultLoadGroupCallParticipants =
  LoadGroupCallParticipants
    { group_call_id = Nothing
    , limit         = Nothing
    }

