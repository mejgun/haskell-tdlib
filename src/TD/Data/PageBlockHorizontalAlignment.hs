module TD.Data.PageBlockHorizontalAlignment (PageBlockHorizontalAlignment(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data PageBlockHorizontalAlignment -- ^ Describes a horizontal alignment of a table cell content
  = PageBlockHorizontalAlignmentLeft -- ^ The content must be left-aligned
  | PageBlockHorizontalAlignmentCenter -- ^ The content must be center-aligned
  | PageBlockHorizontalAlignmentRight -- ^ The content must be right-aligned
  deriving (Eq)

instance Show PageBlockHorizontalAlignment where
  show PageBlockHorizontalAlignmentLeft
      = "PageBlockHorizontalAlignmentLeft"
  show PageBlockHorizontalAlignmentCenter
      = "PageBlockHorizontalAlignmentCenter"
  show PageBlockHorizontalAlignmentRight
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

instance AT.ToJSON PageBlockHorizontalAlignment where
  toJSON PageBlockHorizontalAlignmentLeft
      = A.object
        [ "@type" A..= AT.String "pageBlockHorizontalAlignmentLeft"
        ]
  toJSON PageBlockHorizontalAlignmentCenter
      = A.object
        [ "@type" A..= AT.String "pageBlockHorizontalAlignmentCenter"
        ]
  toJSON PageBlockHorizontalAlignmentRight
      = A.object
        [ "@type" A..= AT.String "pageBlockHorizontalAlignmentRight"
        ]
