module TD.Data.PollVoteRestrictionReason
  (PollVoteRestrictionReason(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Reason of vote restriction in the poll for the current user
data PollVoteRestrictionReason
  = PollVoteRestrictionReasonClosed -- ^ The poll is closed
  | PollVoteRestrictionReasonYetUnsent -- ^ The poll isn't sent yet
  | PollVoteRestrictionReasonScheduled -- ^ The poll is from a scheduled message
  | PollVoteRestrictionReasonCountryRestricted -- ^ The user is from a country, users from which aren't allowed to vote
    { country_code :: Maybe T.Text -- ^ Two-letter ISO 3166-1 alpha-2 code of the current user's country
    }
  | PollVoteRestrictionReasonMembershipRequired -- ^ The user must be a member of the chat for at least a day to vote
    { chat_id :: Maybe Int -- ^ Identifier of the chat which must be joined for at least a day before the user can vote
    }
  | PollVoteRestrictionReasonOther -- ^ The poll can't be voted by the user due to some other reason
  deriving (Eq, Show)

instance I.ShortShow PollVoteRestrictionReason where
  shortShow PollVoteRestrictionReasonClosed
      = "PollVoteRestrictionReasonClosed"
  shortShow PollVoteRestrictionReasonYetUnsent
      = "PollVoteRestrictionReasonYetUnsent"
  shortShow PollVoteRestrictionReasonScheduled
      = "PollVoteRestrictionReasonScheduled"
  shortShow PollVoteRestrictionReasonCountryRestricted
    { country_code = country_code_
    }
      = "PollVoteRestrictionReasonCountryRestricted"
        ++ I.cc
        [ "country_code" `I.p` country_code_
        ]
  shortShow PollVoteRestrictionReasonMembershipRequired
    { chat_id = chat_id_
    }
      = "PollVoteRestrictionReasonMembershipRequired"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]
  shortShow PollVoteRestrictionReasonOther
      = "PollVoteRestrictionReasonOther"

instance AT.FromJSON PollVoteRestrictionReason where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pollVoteRestrictionReasonClosed"             -> pure PollVoteRestrictionReasonClosed
      "pollVoteRestrictionReasonYetUnsent"          -> pure PollVoteRestrictionReasonYetUnsent
      "pollVoteRestrictionReasonScheduled"          -> pure PollVoteRestrictionReasonScheduled
      "pollVoteRestrictionReasonCountryRestricted"  -> parsePollVoteRestrictionReasonCountryRestricted v
      "pollVoteRestrictionReasonMembershipRequired" -> parsePollVoteRestrictionReasonMembershipRequired v
      "pollVoteRestrictionReasonOther"              -> pure PollVoteRestrictionReasonOther
      _                                             -> mempty
    
    where
      parsePollVoteRestrictionReasonCountryRestricted :: A.Value -> AT.Parser PollVoteRestrictionReason
      parsePollVoteRestrictionReasonCountryRestricted = A.withObject "PollVoteRestrictionReasonCountryRestricted" $ \o -> do
        country_code_ <- o A..:?  "country_code"
        pure $ PollVoteRestrictionReasonCountryRestricted
          { country_code = country_code_
          }
      parsePollVoteRestrictionReasonMembershipRequired :: A.Value -> AT.Parser PollVoteRestrictionReason
      parsePollVoteRestrictionReasonMembershipRequired = A.withObject "PollVoteRestrictionReasonMembershipRequired" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ PollVoteRestrictionReasonMembershipRequired
          { chat_id = chat_id_
          }
  parseJSON _ = mempty

