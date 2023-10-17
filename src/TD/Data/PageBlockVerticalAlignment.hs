module TD.Data.PageBlockVerticalAlignment
  (PageBlockVerticalAlignment(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes a Vertical alignment of a table cell content
data PageBlockVerticalAlignment
  = PageBlockVerticalAlignmentTop -- ^ The content must be top-aligned
  | PageBlockVerticalAlignmentMiddle -- ^ The content must be middle-aligned
  | PageBlockVerticalAlignmentBottom -- ^ The content must be bottom-aligned
  deriving (Eq, Show)

instance I.ShortShow PageBlockVerticalAlignment where
  shortShow PageBlockVerticalAlignmentTop
      = "PageBlockVerticalAlignmentTop"
  shortShow PageBlockVerticalAlignmentMiddle
      = "PageBlockVerticalAlignmentMiddle"
  shortShow PageBlockVerticalAlignmentBottom
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

