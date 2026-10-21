module TD.Data.InputPageBlockListItem
  ( InputPageBlockListItem(..)    
  , defaultInputPageBlockListItem 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import {-# SOURCE #-} qualified TD.Data.InputPageBlock as InputPageBlock
import qualified Data.Text as T

data InputPageBlockListItem
  = InputPageBlockListItem -- ^ Describes an item of a list page block to be sent
    { blocks       :: Maybe [InputPageBlock.InputPageBlock] -- ^ Item blocks
    , has_checkbox :: Maybe Bool                            -- ^ True, if the item has a checkbox
    , is_checked   :: Maybe Bool                            -- ^ True, if the item is checked
    , value        :: Maybe Int                             -- ^ Value of the item; pass 0 for unordered lists
    , _type        :: Maybe T.Text                          -- ^ Type of item numbering; pass "a" for lowercase letters, "A" for uppercase letters, "i" for lowercase Roman numerals, "I" for uppercase Roman numerals, "1" for decimal numbers, or an empty string for unordered lists
    }
  deriving (Eq, Show)

instance I.ShortShow InputPageBlockListItem where
  shortShow InputPageBlockListItem
    { blocks       = blocks_
    , has_checkbox = has_checkbox_
    , is_checked   = is_checked_
    , value        = value_
    , _type        = _type_
    }
      = "InputPageBlockListItem"
        ++ I.cc
        [ "blocks"       `I.p` blocks_
        , "has_checkbox" `I.p` has_checkbox_
        , "is_checked"   `I.p` is_checked_
        , "value"        `I.p` value_
        , "_type"        `I.p` _type_
        ]

instance AT.FromJSON InputPageBlockListItem where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputPageBlockListItem" -> parseInputPageBlockListItem v
      _                        -> mempty
    
    where
      parseInputPageBlockListItem :: A.Value -> AT.Parser InputPageBlockListItem
      parseInputPageBlockListItem = A.withObject "InputPageBlockListItem" $ \o -> do
        blocks_       <- o A..:?  "blocks"
        has_checkbox_ <- o A..:?  "has_checkbox"
        is_checked_   <- o A..:?  "is_checked"
        value_        <- o A..:?  "value"
        _type_        <- o A..:?  "type"
        pure $ InputPageBlockListItem
          { blocks       = blocks_
          , has_checkbox = has_checkbox_
          , is_checked   = is_checked_
          , value        = value_
          , _type        = _type_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPageBlockListItem where
  toJSON InputPageBlockListItem
    { blocks       = blocks_
    , has_checkbox = has_checkbox_
    , is_checked   = is_checked_
    , value        = value_
    , _type        = _type_
    }
      = A.object
        [ "@type"        A..= AT.String "inputPageBlockListItem"
        , "blocks"       A..= blocks_
        , "has_checkbox" A..= has_checkbox_
        , "is_checked"   A..= is_checked_
        , "value"        A..= value_
        , "type"         A..= _type_
        ]

defaultInputPageBlockListItem :: InputPageBlockListItem
defaultInputPageBlockListItem =
  InputPageBlockListItem
    { blocks       = Nothing
    , has_checkbox = Nothing
    , is_checked   = Nothing
    , value        = Nothing
    , _type        = Nothing
    }

