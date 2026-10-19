module TD.Data.TonNft
  (TonNft(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.PhotoSize as PhotoSize
import qualified TD.Data.Document as Document
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.TonNftAttribute as TonNftAttribute
import qualified TD.Data.JsonValue as JsonValue

data TonNft
  = TonNft -- ^ Represents an NFT in the TON blockchain
    { collection_address :: Maybe T.Text                            -- ^ Address of the collection to which the NFT belongs; may be empty if unknown
    , address            :: Maybe T.Text                            -- ^ Address of the NFT
    , owner_address      :: Maybe T.Text                            -- ^ Address of the owner of the NFT
    , index              :: Maybe T.Text                            -- ^ Index of the NFT among all NFTs from the collection as a decimal number
    , name               :: Maybe T.Text                            -- ^ Name of the NFT
    , description        :: Maybe T.Text                            -- ^ Description of the NFT
    , image              :: Maybe PhotoSize.PhotoSize               -- ^ Image of the NFT; may be null if none
    , thumbnail          :: Maybe PhotoSize.PhotoSize               -- ^ Thumbnail of the NFT; may be null if none
    , content            :: Maybe Document.Document                 -- ^ Content of the NFT; may be null if none
    , sticker            :: Maybe Sticker.Sticker                   -- ^ Sticker of the NFT; may be null if none
    , attributes         :: Maybe [TonNftAttribute.TonNftAttribute] -- ^ Attributes of the NFT
    , extra              :: Maybe JsonValue.JsonValue               -- ^ Additional data about the NFT; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow TonNft where
  shortShow TonNft
    { collection_address = collection_address_
    , address            = address_
    , owner_address      = owner_address_
    , index              = index_
    , name               = name_
    , description        = description_
    , image              = image_
    , thumbnail          = thumbnail_
    , content            = content_
    , sticker            = sticker_
    , attributes         = attributes_
    , extra              = extra_
    }
      = "TonNft"
        ++ I.cc
        [ "collection_address" `I.p` collection_address_
        , "address"            `I.p` address_
        , "owner_address"      `I.p` owner_address_
        , "index"              `I.p` index_
        , "name"               `I.p` name_
        , "description"        `I.p` description_
        , "image"              `I.p` image_
        , "thumbnail"          `I.p` thumbnail_
        , "content"            `I.p` content_
        , "sticker"            `I.p` sticker_
        , "attributes"         `I.p` attributes_
        , "extra"              `I.p` extra_
        ]

instance AT.FromJSON TonNft where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonNft" -> parseTonNft v
      _        -> mempty
    
    where
      parseTonNft :: A.Value -> AT.Parser TonNft
      parseTonNft = A.withObject "TonNft" $ \o -> do
        collection_address_ <- o A..:?  "collection_address"
        address_            <- o A..:?  "address"
        owner_address_      <- o A..:?  "owner_address"
        index_              <- o A..:?  "index"
        name_               <- o A..:?  "name"
        description_        <- o A..:?  "description"
        image_              <- o A..:?  "image"
        thumbnail_          <- o A..:?  "thumbnail"
        content_            <- o A..:?  "content"
        sticker_            <- o A..:?  "sticker"
        attributes_         <- o A..:?  "attributes"
        extra_              <- o A..:?  "extra"
        pure $ TonNft
          { collection_address = collection_address_
          , address            = address_
          , owner_address      = owner_address_
          , index              = index_
          , name               = name_
          , description        = description_
          , image              = image_
          , thumbnail          = thumbnail_
          , content            = content_
          , sticker            = sticker_
          , attributes         = attributes_
          , extra              = extra_
          }
  parseJSON _ = mempty

