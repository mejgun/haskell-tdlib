{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.PageBlockVerticalAlignment where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a Vertical alignment of a table cell content
data PageBlockVerticalAlignment
  = -- | The content must be top-aligned
    PageBlockVerticalAlignmentTop
  | -- | The content must be middle-aligned
    PageBlockVerticalAlignmentMiddle
  | -- | The content must be bottom-aligned
    PageBlockVerticalAlignmentBottom
  deriving (Eq)

instance Show PageBlockVerticalAlignment where
  show PageBlockVerticalAlignmentTop =
    "PageBlockVerticalAlignmentTop"
      ++ U.cc
        []
  show PageBlockVerticalAlignmentMiddle =
    "PageBlockVerticalAlignmentMiddle"
      ++ U.cc
        []
  show PageBlockVerticalAlignmentBottom =
    "PageBlockVerticalAlignmentBottom"
      ++ U.cc
        []

instance T.FromJSON PageBlockVerticalAlignment where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "pageBlockVerticalAlignmentTop" -> parsePageBlockVerticalAlignmentTop v
      "pageBlockVerticalAlignmentMiddle" -> parsePageBlockVerticalAlignmentMiddle v
      "pageBlockVerticalAlignmentBottom" -> parsePageBlockVerticalAlignmentBottom v
      _ -> fail ""
    where
      parsePageBlockVerticalAlignmentTop :: A.Value -> T.Parser PageBlockVerticalAlignment
      parsePageBlockVerticalAlignmentTop = A.withObject "PageBlockVerticalAlignmentTop" $ \o -> do
        return $ PageBlockVerticalAlignmentTop {}

      parsePageBlockVerticalAlignmentMiddle :: A.Value -> T.Parser PageBlockVerticalAlignment
      parsePageBlockVerticalAlignmentMiddle = A.withObject "PageBlockVerticalAlignmentMiddle" $ \o -> do
        return $ PageBlockVerticalAlignmentMiddle {}

      parsePageBlockVerticalAlignmentBottom :: A.Value -> T.Parser PageBlockVerticalAlignment
      parsePageBlockVerticalAlignmentBottom = A.withObject "PageBlockVerticalAlignmentBottom" $ \o -> do
        return $ PageBlockVerticalAlignmentBottom {}
  parseJSON _ = fail ""

instance T.ToJSON PageBlockVerticalAlignment where
  toJSON PageBlockVerticalAlignmentTop =
    A.object
      [ "@type" A..= T.String "pageBlockVerticalAlignmentTop"
      ]
  toJSON PageBlockVerticalAlignmentMiddle =
    A.object
      [ "@type" A..= T.String "pageBlockVerticalAlignmentMiddle"
      ]
  toJSON PageBlockVerticalAlignmentBottom =
    A.object
      [ "@type" A..= T.String "pageBlockVerticalAlignmentBottom"
      ]
