module TD.Data.PageBlockHorizontalAlignment
  (PageBlockHorizontalAlignment(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes a horizontal alignment of a table cell content
data PageBlockHorizontalAlignment
  = PageBlockHorizontalAlignmentLeft -- ^ The content must be left-aligned
  | PageBlockHorizontalAlignmentCenter -- ^ The content must be center-aligned
  | PageBlockHorizontalAlignmentRight -- ^ The content must be right-aligned
  deriving (Eq, Show)

instance I.ShortShow PageBlockHorizontalAlignment where
  shortShow PageBlockHorizontalAlignmentLeft
      = "PageBlockHorizontalAlignmentLeft"
  shortShow PageBlockHorizontalAlignmentCenter
      = "PageBlockHorizontalAlignmentCenter"
  shortShow PageBlockHorizontalAlignmentRight
      = "PageBlockHorizontalAlignmentRight"

instance AT.FromJSON PageBlockHorizontalAlignment where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pageBlockHorizontalAlignmentLeft"   -> pure PageBlockHorizontalAlignmentLeft
      "pageBlockHorizontalAlignmentCenter" -> pure PageBlockHorizontalAlignmentCenter
      "pageBlockHorizontalAlignmentRight"  -> pure PageBlockHorizontalAlignmentRight
      _                                    -> mempty
    
  parseJSON _ = mempty

