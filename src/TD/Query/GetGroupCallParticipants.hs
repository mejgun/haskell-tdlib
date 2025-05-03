module TD.Query.GetGroupCallParticipants
  (GetGroupCallParticipants(..)
  , defaultGetGroupCallParticipants
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputGroupCall as InputGroupCall

-- | Returns information about participants of a non-joined group call that is not bound to a chat. Returns 'TD.Data.GroupCallParticipants.GroupCallParticipants'
data GetGroupCallParticipants
  = GetGroupCallParticipants
    { input_group_call :: Maybe InputGroupCall.InputGroupCall -- ^ The group call which participants will be returned
    , limit            :: Maybe Int                           -- ^ The maximum number of participants to return; must be positive
    }
  deriving (Eq, Show)

instance I.ShortShow GetGroupCallParticipants where
  shortShow
    GetGroupCallParticipants
      { input_group_call = input_group_call_
      , limit            = limit_
      }
        = "GetGroupCallParticipants"
          ++ I.cc
          [ "input_group_call" `I.p` input_group_call_
          , "limit"            `I.p` limit_
          ]

instance AT.ToJSON GetGroupCallParticipants where
  toJSON
    GetGroupCallParticipants
      { input_group_call = input_group_call_
      , limit            = limit_
      }
        = A.object
          [ "@type"            A..= AT.String "getGroupCallParticipants"
          , "input_group_call" A..= input_group_call_
          , "limit"            A..= limit_
          ]

defaultGetGroupCallParticipants :: GetGroupCallParticipants
defaultGetGroupCallParticipants =
  GetGroupCallParticipants
    { input_group_call = Nothing
    , limit            = Nothing
    }

