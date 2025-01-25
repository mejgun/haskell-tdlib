module TD.Data.ReceivedGifts
  (ReceivedGifts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReceivedGift as ReceivedGift
import qualified Data.Text as T

data ReceivedGifts
  = ReceivedGifts -- ^ Represents a list of gifts received by a user or a chat
    { total_count               :: Maybe Int                         -- ^ The total number of received gifts
    , gifts                     :: Maybe [ReceivedGift.ReceivedGift] -- ^ The list of gifts
    , are_notifications_enabled :: Maybe Bool                        -- ^ True, if notifications about new gifts of the owner are enabled
    , next_offset               :: Maybe T.Text                      -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow ReceivedGifts where
  shortShow ReceivedGifts
    { total_count               = total_count_
    , gifts                     = gifts_
    , are_notifications_enabled = are_notifications_enabled_
    , next_offset               = next_offset_
    }
      = "ReceivedGifts"
        ++ I.cc
        [ "total_count"               `I.p` total_count_
        , "gifts"                     `I.p` gifts_
        , "are_notifications_enabled" `I.p` are_notifications_enabled_
        , "next_offset"               `I.p` next_offset_
        ]

instance AT.FromJSON ReceivedGifts where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "receivedGifts" -> parseReceivedGifts v
      _               -> mempty
    
    where
      parseReceivedGifts :: A.Value -> AT.Parser ReceivedGifts
      parseReceivedGifts = A.withObject "ReceivedGifts" $ \o -> do
        total_count_               <- o A..:?  "total_count"
        gifts_                     <- o A..:?  "gifts"
        are_notifications_enabled_ <- o A..:?  "are_notifications_enabled"
        next_offset_               <- o A..:?  "next_offset"
        pure $ ReceivedGifts
          { total_count               = total_count_
          , gifts                     = gifts_
          , are_notifications_enabled = are_notifications_enabled_
          , next_offset               = next_offset_
          }
  parseJSON _ = mempty

