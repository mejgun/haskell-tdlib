-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockVerticalAlignment where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes a Vertical alignment of a table cell content
data PageBlockVerticalAlignment = 
 -- |
 -- 
 -- The content should be top-aligned
 PageBlockVerticalAlignmentTop |
 -- |
 -- 
 -- The content should be middle-aligned
 PageBlockVerticalAlignmentMiddle |
 -- |
 -- 
 -- The content should be bottom-aligned
 PageBlockVerticalAlignmentBottom deriving (Show, Eq)

instance T.ToJSON PageBlockVerticalAlignment where
 toJSON (PageBlockVerticalAlignmentTop {  }) =
  A.object [ "@type" A..= T.String "pageBlockVerticalAlignmentTop" ]

 toJSON (PageBlockVerticalAlignmentMiddle {  }) =
  A.object [ "@type" A..= T.String "pageBlockVerticalAlignmentMiddle" ]

 toJSON (PageBlockVerticalAlignmentBottom {  }) =
  A.object [ "@type" A..= T.String "pageBlockVerticalAlignmentBottom" ]

instance T.FromJSON PageBlockVerticalAlignment where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pageBlockVerticalAlignmentTop" -> parsePageBlockVerticalAlignmentTop v
   "pageBlockVerticalAlignmentMiddle" -> parsePageBlockVerticalAlignmentMiddle v
   "pageBlockVerticalAlignmentBottom" -> parsePageBlockVerticalAlignmentBottom v
   _ -> mempty
  where
   parsePageBlockVerticalAlignmentTop :: A.Value -> T.Parser PageBlockVerticalAlignment
   parsePageBlockVerticalAlignmentTop = A.withObject "PageBlockVerticalAlignmentTop" $ \o -> do
    return $ PageBlockVerticalAlignmentTop {  }

   parsePageBlockVerticalAlignmentMiddle :: A.Value -> T.Parser PageBlockVerticalAlignment
   parsePageBlockVerticalAlignmentMiddle = A.withObject "PageBlockVerticalAlignmentMiddle" $ \o -> do
    return $ PageBlockVerticalAlignmentMiddle {  }

   parsePageBlockVerticalAlignmentBottom :: A.Value -> T.Parser PageBlockVerticalAlignment
   parsePageBlockVerticalAlignmentBottom = A.withObject "PageBlockVerticalAlignmentBottom" $ \o -> do
    return $ PageBlockVerticalAlignmentBottom {  }