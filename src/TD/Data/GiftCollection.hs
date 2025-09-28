module TD.Data.GiftCollection
  (GiftCollection(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Sticker as Sticker

data GiftCollection
  = GiftCollection -- ^ Describes collection of gifts
    { _id        :: Maybe Int             -- ^ Unique identifier of the collection
    , name       :: Maybe T.Text          -- ^ Name of the collection
    , icon       :: Maybe Sticker.Sticker -- ^ Icon of the collection; may be null if none
    , gift_count :: Maybe Int             -- ^ Total number of gifts in the collection
    }
  deriving (Eq, Show)

instance I.ShortShow GiftCollection where
  shortShow GiftCollection
    { _id        = _id_
    , name       = name_
    , icon       = icon_
    , gift_count = gift_count_
    }
      = "GiftCollection"
        ++ I.cc
        [ "_id"        `I.p` _id_
        , "name"       `I.p` name_
        , "icon"       `I.p` icon_
        , "gift_count" `I.p` gift_count_
        ]

instance AT.FromJSON GiftCollection where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftCollection" -> parseGiftCollection v
      _                -> mempty
    
    where
      parseGiftCollection :: A.Value -> AT.Parser GiftCollection
      parseGiftCollection = A.withObject "GiftCollection" $ \o -> do
        _id_        <- o A..:?  "id"
        name_       <- o A..:?  "name"
        icon_       <- o A..:?  "icon"
        gift_count_ <- o A..:?  "gift_count"
        pure $ GiftCollection
          { _id        = _id_
          , name       = name_
          , icon       = icon_
          , gift_count = gift_count_
          }
  parseJSON _ = mempty

