module TD.Data.BlockList
  (BlockList(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of block list
data BlockList
  = BlockListMain -- ^ The main block list that disallows writing messages to the current user, receiving their status and photo, viewing of stories, and some other actions
  | BlockListStories -- ^ The block list that disallows viewing of stories of the current user
  deriving (Eq, Show)

instance I.ShortShow BlockList where
  shortShow BlockListMain
      = "BlockListMain"
  shortShow BlockListStories
      = "BlockListStories"

instance AT.FromJSON BlockList where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "blockListMain"    -> pure BlockListMain
      "blockListStories" -> pure BlockListStories
      _                  -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON BlockList where
  toJSON BlockListMain
      = A.object
        [ "@type" A..= AT.String "blockListMain"
        ]
  toJSON BlockListStories
      = A.object
        [ "@type" A..= AT.String "blockListStories"
        ]

