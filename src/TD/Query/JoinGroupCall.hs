module TD.Query.JoinGroupCall
  (JoinGroupCall(..)
  , defaultJoinGroupCall
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputGroupCall as InputGroupCall
import qualified TD.Data.GroupCallJoinParameters as GroupCallJoinParameters

-- | Joins a regular group call that is not bound to a chat. Returns 'TD.Data.GroupCallInfo.GroupCallInfo'
data JoinGroupCall
  = JoinGroupCall
    { input_group_call :: Maybe InputGroupCall.InputGroupCall                   -- ^ The group call to join
    , join_parameters  :: Maybe GroupCallJoinParameters.GroupCallJoinParameters -- ^ Parameters to join the call
    }
  deriving (Eq, Show)

instance I.ShortShow JoinGroupCall where
  shortShow
    JoinGroupCall
      { input_group_call = input_group_call_
      , join_parameters  = join_parameters_
      }
        = "JoinGroupCall"
          ++ I.cc
          [ "input_group_call" `I.p` input_group_call_
          , "join_parameters"  `I.p` join_parameters_
          ]

instance AT.ToJSON JoinGroupCall where
  toJSON
    JoinGroupCall
      { input_group_call = input_group_call_
      , join_parameters  = join_parameters_
      }
        = A.object
          [ "@type"            A..= AT.String "joinGroupCall"
          , "input_group_call" A..= input_group_call_
          , "join_parameters"  A..= join_parameters_
          ]

defaultJoinGroupCall :: JoinGroupCall
defaultJoinGroupCall =
  JoinGroupCall
    { input_group_call = Nothing
    , join_parameters  = Nothing
    }

