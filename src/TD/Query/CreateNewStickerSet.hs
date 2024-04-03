module TD.Query.CreateNewStickerSet
  (CreateNewStickerSet(..)
  , defaultCreateNewStickerSet
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.StickerType as StickerType
import qualified TD.Data.InputSticker as InputSticker

-- | Creates a new sticker set. Returns the newly created sticker set. Returns 'TD.Data.StickerSet.StickerSet'
data CreateNewStickerSet
  = CreateNewStickerSet
    { user_id          :: Maybe Int                         -- ^ Sticker set owner; ignored for regular users
    , title            :: Maybe T.Text                      -- ^ Sticker set title; 1-64 characters
    , name             :: Maybe T.Text                      -- ^ Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_<bot username>"* (*<bot_username>* is case insensitive) for bots; 0-64 characters. If empty, then the name returned by getSuggestedStickerSetName will be used automatically
    , sticker_type     :: Maybe StickerType.StickerType     -- ^ Type of the stickers in the set
    , needs_repainting :: Maybe Bool                        -- ^ Pass true if stickers in the sticker set must be repainted; for custom emoji sticker sets only
    , stickers         :: Maybe [InputSticker.InputSticker] -- ^ List of stickers to be added to the set; 1-200 stickers for custom emoji sticker sets, and 1-120 stickers otherwise. For TGS stickers, uploadStickerFile must be used before the sticker is shown
    , source           :: Maybe T.Text                      -- ^ Source of the sticker set; may be empty if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow CreateNewStickerSet where
  shortShow
    CreateNewStickerSet
      { user_id          = user_id_
      , title            = title_
      , name             = name_
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
          , "sticker_type"     A..= sticker_type_
          , "needs_repainting" A..= needs_repainting_
          , "stickers"         A..= stickers_
          , "source"           A..= source_
          ]

defaultCreateNewStickerSet :: CreateNewStickerSet
defaultCreateNewStickerSet =
  CreateNewStickerSet
    { user_id          = Nothing
    , title            = Nothing
    , name             = Nothing
    , sticker_type     = Nothing
    , needs_repainting = Nothing
    , stickers         = Nothing
    , source           = Nothing
    }

