module TD.Data.PollVoters
  (PollVoters(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PollVoter as PollVoter

data PollVoters
  = PollVoters -- ^ Represents a list of poll voters
    { total_count :: Maybe Int                   -- ^ Approximate total number of poll voters found
    , voters      :: Maybe [PollVoter.PollVoter] -- ^ List of poll voters
    }
  deriving (Eq, Show)

instance I.ShortShow PollVoters where
  shortShow PollVoters
    { total_count = total_count_
    , voters      = voters_
    }
      = "PollVoters"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "voters"      `I.p` voters_
        ]

instance AT.FromJSON PollVoters where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pollVoters" -> parsePollVoters v
      _            -> mempty
    
    where
      parsePollVoters :: A.Value -> AT.Parser PollVoters
      parsePollVoters = A.withObject "PollVoters" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        voters_      <- o A..:?  "voters"
        pure $ PollVoters
          { total_count = total_count_
          , voters      = voters_
          }
  parseJSON _ = mempty

