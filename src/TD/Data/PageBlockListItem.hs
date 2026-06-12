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
    { label        :: Maybe T.Text                -- ^ Item label
    , blocks       :: Maybe [PageBlock.PageBlock] -- ^ Item blocks
    , has_checkbox :: Maybe Bool                  -- ^ True, if the item has a checkbox
    , is_checked   :: Maybe Bool                  -- ^ True, if the item is checked
    , value        :: Maybe Int                   -- ^ Value of the item; 0 for unordered lists
    , _type        :: Maybe T.Text                -- ^ Type of the item numbering type; must be one of "a" for a lowercase letters, "A" for an uppercase letters, "i" for lowercase Roman numerals, "I" for uppercase Roman numerals, "1" for decimal numbers, or empty for unordered lists
    }
  deriving (Eq, Show)

instance I.ShortShow PageBlockListItem where
  shortShow PageBlockListItem
    { label        = label_
    , blocks       = blocks_
    , has_checkbox = has_checkbox_
    , is_checked   = is_checked_
    , value        = value_
    , _type        = _type_
    }
      = "PageBlockListItem"
        ++ I.cc
        [ "label"        `I.p` label_
        , "blocks"       `I.p` blocks_
        , "has_checkbox" `I.p` has_checkbox_
        , "is_checked"   `I.p` is_checked_
        , "value"        `I.p` value_
        , "_type"        `I.p` _type_
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
        label_        <- o A..:?  "label"
        blocks_       <- o A..:?  "blocks"
        has_checkbox_ <- o A..:?  "has_checkbox"
        is_checked_   <- o A..:?  "is_checked"
        value_        <- o A..:?  "value"
        _type_        <- o A..:?  "type"
        pure $ PageBlockListItem
          { label        = label_
          , blocks       = blocks_
          , has_checkbox = has_checkbox_
          , is_checked   = is_checked_
          , value        = value_
          , _type        = _type_
          }
  parseJSON _ = mempty

instance AT.ToJSON PageBlockListItem where
  toJSON PageBlockListItem
    { label        = label_
    , blocks       = blocks_
    , has_checkbox = has_checkbox_
    , is_checked   = is_checked_
    , value        = value_
    , _type        = _type_
    }
      = A.object
        [ "@type"        A..= AT.String "pageBlockListItem"
        , "label"        A..= label_
        , "blocks"       A..= blocks_
        , "has_checkbox" A..= has_checkbox_
        , "is_checked"   A..= is_checked_
        , "value"        A..= value_
        , "type"         A..= _type_
        ]

defaultPageBlockListItem :: PageBlockListItem
defaultPageBlockListItem =
  PageBlockListItem
    { label        = Nothing
    , blocks       = Nothing
    , has_checkbox = Nothing
    , is_checked   = Nothing
    , value        = Nothing
    , _type        = Nothing
    }

