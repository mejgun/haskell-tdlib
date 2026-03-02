module TD.Data.PollVoter
  (PollVoter(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data PollVoter
  = PollVoter -- ^ Represents a poll voter
    { voter_id :: Maybe MessageSender.MessageSender -- ^ The voter identifier
    , date     :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the vote was added
    }
  deriving (Eq, Show)

instance I.ShortShow PollVoter where
  shortShow PollVoter
    { voter_id = voter_id_
    , date     = date_
    }
      = "PollVoter"
        ++ I.cc
        [ "voter_id" `I.p` voter_id_
        , "date"     `I.p` date_
        ]

instance AT.FromJSON PollVoter where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pollVoter" -> parsePollVoter v
      _           -> mempty
    
    where
      parsePollVoter :: A.Value -> AT.Parser PollVoter
      parsePollVoter = A.withObject "PollVoter" $ \o -> do
        voter_id_ <- o A..:?  "voter_id"
        date_     <- o A..:?  "date"
        pure $ PollVoter
          { voter_id = voter_id_
          , date     = date_
          }
  parseJSON _ = mempty

