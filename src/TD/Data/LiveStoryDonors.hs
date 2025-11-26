module TD.Data.LiveStoryDonors
  (LiveStoryDonors(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PaidReactor as PaidReactor

data LiveStoryDonors
  = LiveStoryDonors -- ^ Contains a list of users and chats that spend most money on paid messages and reactions in a live story
    { total_star_count :: Maybe Int                       -- ^ Total amount of spend Telegram Stars
    , top_donors       :: Maybe [PaidReactor.PaidReactor] -- ^ List of top donors in the live story
    }
  deriving (Eq, Show)

instance I.ShortShow LiveStoryDonors where
  shortShow LiveStoryDonors
    { total_star_count = total_star_count_
    , top_donors       = top_donors_
    }
      = "LiveStoryDonors"
        ++ I.cc
        [ "total_star_count" `I.p` total_star_count_
        , "top_donors"       `I.p` top_donors_
        ]

instance AT.FromJSON LiveStoryDonors where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "liveStoryDonors" -> parseLiveStoryDonors v
      _                 -> mempty
    
    where
      parseLiveStoryDonors :: A.Value -> AT.Parser LiveStoryDonors
      parseLiveStoryDonors = A.withObject "LiveStoryDonors" $ \o -> do
        total_star_count_ <- o A..:?  "total_star_count"
        top_donors_       <- o A..:?  "top_donors"
        pure $ LiveStoryDonors
          { total_star_count = total_star_count_
          , top_donors       = top_donors_
          }
  parseJSON _ = mempty

