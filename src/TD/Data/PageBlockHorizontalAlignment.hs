{-# LANGUAGE OverloadedStrings #-}

module TD.Data.PageBlockHorizontalAlignment where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a horizontal alignment of a table cell content
data PageBlockHorizontalAlignment
  = -- | The content must be left-aligned
    PageBlockHorizontalAlignmentLeft
  | -- | The content must be center-aligned
    PageBlockHorizontalAlignmentCenter
  | -- | The content must be right-aligned
    PageBlockHorizontalAlignmentRight
  deriving (Eq)

instance Show PageBlockHorizontalAlignment where
  show PageBlockHorizontalAlignmentLeft =
    "PageBlockHorizontalAlignmentLeft"
      ++ U.cc
        []
  show PageBlockHorizontalAlignmentCenter =
    "PageBlockHorizontalAlignmentCenter"
      ++ U.cc
        []
  show PageBlockHorizontalAlignmentRight =
    "PageBlockHorizontalAlignmentRight"
      ++ U.cc
        []

instance T.FromJSON PageBlockHorizontalAlignment where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "pageBlockHorizontalAlignmentLeft" -> parsePageBlockHorizontalAlignmentLeft v
      "pageBlockHorizontalAlignmentCenter" -> parsePageBlockHorizontalAlignmentCenter v
      "pageBlockHorizontalAlignmentRight" -> parsePageBlockHorizontalAlignmentRight v
      _ -> mempty
    where
      parsePageBlockHorizontalAlignmentLeft :: A.Value -> T.Parser PageBlockHorizontalAlignment
      parsePageBlockHorizontalAlignmentLeft = A.withObject "PageBlockHorizontalAlignmentLeft" $ \o -> do
        return $ PageBlockHorizontalAlignmentLeft {}

      parsePageBlockHorizontalAlignmentCenter :: A.Value -> T.Parser PageBlockHorizontalAlignment
      parsePageBlockHorizontalAlignmentCenter = A.withObject "PageBlockHorizontalAlignmentCenter" $ \o -> do
        return $ PageBlockHorizontalAlignmentCenter {}

      parsePageBlockHorizontalAlignmentRight :: A.Value -> T.Parser PageBlockHorizontalAlignment
      parsePageBlockHorizontalAlignmentRight = A.withObject "PageBlockHorizontalAlignmentRight" $ \o -> do
        return $ PageBlockHorizontalAlignmentRight {}
  parseJSON _ = mempty

instance T.ToJSON PageBlockHorizontalAlignment where
  toJSON PageBlockHorizontalAlignmentLeft =
    A.object
      [ "@type" A..= T.String "pageBlockHorizontalAlignmentLeft"
      ]
  toJSON PageBlockHorizontalAlignmentCenter =
    A.object
      [ "@type" A..= T.String "pageBlockHorizontalAlignmentCenter"
      ]
  toJSON PageBlockHorizontalAlignmentRight =
    A.object
      [ "@type" A..= T.String "pageBlockHorizontalAlignmentRight"
      ]
