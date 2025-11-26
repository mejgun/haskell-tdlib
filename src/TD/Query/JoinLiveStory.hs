module TD.Query.JoinLiveStory
  (JoinLiveStory(..)
  , defaultJoinLiveStory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GroupCallJoinParameters as GroupCallJoinParameters

-- | Joins a group call of an active live story. Returns join response payload for tgcalls. Returns 'TD.Data.Text.Text'
data JoinLiveStory
  = JoinLiveStory
    { group_call_id   :: Maybe Int                                             -- ^ Group call identifier
    , join_parameters :: Maybe GroupCallJoinParameters.GroupCallJoinParameters -- ^ Parameters to join the call
    }
  deriving (Eq, Show)

instance I.ShortShow JoinLiveStory where
  shortShow
    JoinLiveStory
      { group_call_id   = group_call_id_
      , join_parameters = join_parameters_
      }
        = "JoinLiveStory"
          ++ I.cc
          [ "group_call_id"   `I.p` group_call_id_
          , "join_parameters" `I.p` join_parameters_
          ]

instance AT.ToJSON JoinLiveStory where
  toJSON
    JoinLiveStory
      { group_call_id   = group_call_id_
      , join_parameters = join_parameters_
      }
        = A.object
          [ "@type"           A..= AT.String "joinLiveStory"
          , "group_call_id"   A..= group_call_id_
          , "join_parameters" A..= join_parameters_
          ]

defaultJoinLiveStory :: JoinLiveStory
defaultJoinLiveStory =
  JoinLiveStory
    { group_call_id   = Nothing
    , join_parameters = Nothing
    }

