module TD.Data.PageBlockVerticalAlignment (PageBlockVerticalAlignment(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data PageBlockVerticalAlignment -- ^ Describes a Vertical alignment of a table cell content
  = PageBlockVerticalAlignmentTop -- ^ The content must be top-aligned
  | PageBlockVerticalAlignmentMiddle -- ^ The content must be middle-aligned
  | PageBlockVerticalAlignmentBottom -- ^ The content must be bottom-aligned
  deriving (Eq)

instance Show PageBlockVerticalAlignment where
  show PageBlockVerticalAlignmentTop
      = "PageBlockVerticalAlignmentTop"
  show PageBlockVerticalAlignmentMiddle
      = "PageBlockVerticalAlignmentMiddle"
  show PageBlockVerticalAlignmentBottom
      = "PageBlockVerticalAlignmentBottom"

instance AT.FromJSON PageBlockVerticalAlignment where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pageBlockVerticalAlignmentTop"    -> pure PageBlockVerticalAlignmentTop
      "pageBlockVerticalAlignmentMiddle" -> pure PageBlockVerticalAlignmentMiddle
      "pageBlockVerticalAlignmentBottom" -> pure PageBlockVerticalAlignmentBottom
      _                                  -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON PageBlockVerticalAlignment where
  toJSON PageBlockVerticalAlignmentTop
      = A.object
        [ "@type" A..= AT.String "pageBlockVerticalAlignmentTop"
        ]
  toJSON PageBlockVerticalAlignmentMiddle
      = A.object
        [ "@type" A..= AT.String "pageBlockVerticalAlignmentMiddle"
        ]
  toJSON PageBlockVerticalAlignmentBottom
      = A.object
        [ "@type" A..= AT.String "pageBlockVerticalAlignmentBottom"
        ]
