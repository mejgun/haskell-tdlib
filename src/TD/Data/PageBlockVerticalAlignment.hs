module TD.Data.PageBlockVerticalAlignment
  (PageBlockVerticalAlignment(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Describes a Vertical alignment of a table cell content
data PageBlockVerticalAlignment
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

