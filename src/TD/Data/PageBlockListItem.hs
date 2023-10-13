module TD.Data.PageBlockListItem
  ( PageBlockListItem(..)    
  , defaultPageBlockListItem 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import {-# SOURCE #-} qualified TD.Data.PageBlock as PageBlock

data PageBlockListItem
  = PageBlockListItem -- ^ Describes an item of a list page block
    { label       :: Maybe T.Text                -- ^ Item label
    , page_blocks :: Maybe [PageBlock.PageBlock] -- ^ Item blocks
    }
  deriving (Eq)

instance Show PageBlockListItem where
  show PageBlockListItem
    { label       = label_
    , page_blocks = page_blocks_
    }
      = "PageBlockListItem"
        ++ I.cc
        [ "label"       `I.p` label_
        , "page_blocks" `I.p` page_blocks_
        ]

instance AT.FromJSON PageBlockListItem where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pageBlockListItem" -> parsePageBlockListItem v
      _                   -> mempty
    
    where
      parsePageBlockListItem :: A.Value -> AT.Parser PageBlockListItem
      parsePageBlockListItem = A.withObject "PageBlockListItem" $ \o -> do
        label_       <- o A..:?  "label"
        page_blocks_ <- o A..:?  "page_blocks"
        pure $ PageBlockListItem
          { label       = label_
          , page_blocks = page_blocks_
          }
  parseJSON _ = mempty

instance AT.ToJSON PageBlockListItem where
  toJSON PageBlockListItem
    { label       = label_
    , page_blocks = page_blocks_
    }
      = A.object
        [ "@type"       A..= AT.String "pageBlockListItem"
        , "label"       A..= label_
        , "page_blocks" A..= page_blocks_
        ]

defaultPageBlockListItem :: PageBlockListItem
defaultPageBlockListItem =
  PageBlockListItem
    { label       = Nothing
    , page_blocks = Nothing
    }

