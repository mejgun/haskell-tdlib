module TD.Query.JoinVideoChat
  (JoinVideoChat(..)
  , defaultJoinVideoChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.GroupCallJoinParameters as GroupCallJoinParameters
import qualified Data.Text as T

-- | Joins an active video chat. Returns join response payload for tgcalls. Returns 'TD.Data.Text.Text'
data JoinVideoChat
  = JoinVideoChat
    { group_call_id   :: Maybe Int                                             -- ^ Group call identifier
    , participant_id  :: Maybe MessageSender.MessageSender                     -- ^ Identifier of a group call participant, which will be used to join the call; pass null to join as self; video chats only
    , join_parameters :: Maybe GroupCallJoinParameters.GroupCallJoinParameters -- ^ Parameters to join the call
    , invite_hash     :: Maybe T.Text                                          -- ^ Invite hash as received from internalLinkTypeVideoChat
    }
  deriving (Eq, Show)

instance I.ShortShow JoinVideoChat where
  shortShow
    JoinVideoChat
      { group_call_id   = group_call_id_
      , participant_id  = participant_id_
      , join_parameters = join_parameters_
      , invite_hash     = invite_hash_
      }
        = "JoinVideoChat"
          ++ I.cc
          [ "group_call_id"   `I.p` group_call_id_
          , "participant_id"  `I.p` participant_id_
          , "join_parameters" `I.p` join_parameters_
          , "invite_hash"     `I.p` invite_hash_
          ]

instance AT.ToJSON JoinVideoChat where
  toJSON
    JoinVideoChat
      { group_call_id   = group_call_id_
      , participant_id  = participant_id_
      , join_parameters = join_parameters_
      , invite_hash     = invite_hash_
      }
        = A.object
          [ "@type"           A..= AT.String "joinVideoChat"
          , "group_call_id"   A..= group_call_id_
          , "participant_id"  A..= participant_id_
          , "join_parameters" A..= join_parameters_
          , "invite_hash"     A..= invite_hash_
          ]

defaultJoinVideoChat :: JoinVideoChat
defaultJoinVideoChat =
  JoinVideoChat
    { group_call_id   = Nothing
    , participant_id  = Nothing
    , join_parameters = Nothing
    , invite_hash     = Nothing
    }

