module TD.Query.CreateNewStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerFormat as StickerFormat
import qualified TD.Data.StickerType as StickerType
import qualified TD.Data.InputSticker as InputSticker

data CreateNewStickerSet -- ^ Creates a new sticker set. Returns the newly created sticker set
  = CreateNewStickerSet
    { user_id          :: Maybe Int                         -- ^ Sticker set owner; ignored for regular users
    , title            :: Maybe T.Text                      -- ^ Sticker set title; 1-64 characters
    , name             :: Maybe T.Text                      -- ^ Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_<bot username>"* (*<bot_username>* is case insensitive) for bots; 1-64 characters
    , sticker_format   :: Maybe StickerFormat.StickerFormat -- ^ Format of the stickers in the set
    , sticker_type     :: Maybe StickerType.StickerType     -- ^ Type of the stickers in the set
    , needs_repainting :: Maybe Bool                        -- ^ Pass true if stickers in the sticker set must be repainted; for custom emoji sticker sets only
    , stickers         :: Maybe [InputSticker.InputSticker] -- ^ List of stickers to be added to the set; must be non-empty. All stickers must have the same format. For TGS stickers, uploadStickerFile must be used before the sticker is shown
    , source           :: Maybe T.Text                      -- ^ Source of the sticker set; may be empty if unknown
    }
  deriving (Eq)

instance Show CreateNewStickerSet where
  show
    CreateNewStickerSet
      { user_id          = user_id_
      , title            = title_
      , name             = name_
      , sticker_format   = sticker_format_
      , sticker_type     = sticker_type_
      , needs_repainting = needs_repainting_
      , stickers         = stickers_
      , source           = source_
      }
        = "CreateNewStickerSet"
          ++ I.cc
          [ "user_id"          `I.p` user_id_
          , "title"            `I.p` title_
          , "name"             `I.p` name_
          , "sticker_format"   `I.p` sticker_format_
          , "sticker_type"     `I.p` sticker_type_
          , "needs_repainting" `I.p` needs_repainting_
          , "stickers"         `I.p` stickers_
          , "source"           `I.p` source_
          ]

instance AT.ToJSON CreateNewStickerSet where
  toJSON
    CreateNewStickerSet
      { user_id          = user_id_
      , title            = title_
      , name             = name_
      , sticker_format   = sticker_format_
      , sticker_type     = sticker_type_
      , needs_repainting = needs_repainting_
      , stickers         = stickers_
      , source           = source_
      }
        = A.object
          [ "@type"            A..= AT.String "createNewStickerSet"
          , "user_id"          A..= user_id_
          , "title"            A..= title_
          , "name"             A..= name_
          , "sticker_format"   A..= sticker_format_
          , "sticker_type"     A..= sticker_type_
          , "needs_repainting" A..= needs_repainting_
          , "stickers"         A..= stickers_
          , "source"           A..= source_
          ]
