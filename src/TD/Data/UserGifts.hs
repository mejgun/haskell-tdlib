module TD.Data.UserGifts
  (UserGifts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UserGift as UserGift
import qualified Data.Text as T

data UserGifts
  = UserGifts -- ^ Represents a list of gifts received by a user
    { total_count :: Maybe Int                 -- ^ The total number of received gifts
    , gifts       :: Maybe [UserGift.UserGift] -- ^ The list of gifts
    , next_offset :: Maybe T.Text              -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow UserGifts where
  shortShow UserGifts
    { total_count = total_count_
    , gifts       = gifts_
    , next_offset = next_offset_
    }
      = "UserGifts"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "gifts"       `I.p` gifts_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON UserGifts where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userGifts" -> parseUserGifts v
      _           -> mempty
    
    where
      parseUserGifts :: A.Value -> AT.Parser UserGifts
      parseUserGifts = A.withObject "UserGifts" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        gifts_       <- o A..:?  "gifts"
        next_offset_ <- o A..:?  "next_offset"
        pure $ UserGifts
          { total_count = total_count_
          , gifts       = gifts_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

