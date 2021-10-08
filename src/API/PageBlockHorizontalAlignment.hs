-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockHorizontalAlignment where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes a horizontal alignment of a table cell content
data PageBlockHorizontalAlignment = 
 -- |
 -- 
 -- The content must be left-aligned
 PageBlockHorizontalAlignmentLeft |
 -- |
 -- 
 -- The content must be center-aligned
 PageBlockHorizontalAlignmentCenter |
 -- |
 -- 
 -- The content must be right-aligned
 PageBlockHorizontalAlignmentRight deriving (Eq)

instance Show PageBlockHorizontalAlignment where
 show PageBlockHorizontalAlignmentLeft {  } =
  "PageBlockHorizontalAlignmentLeft" ++ cc [ ]

 show PageBlockHorizontalAlignmentCenter {  } =
  "PageBlockHorizontalAlignmentCenter" ++ cc [ ]

 show PageBlockHorizontalAlignmentRight {  } =
  "PageBlockHorizontalAlignmentRight" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON PageBlockHorizontalAlignment where
 toJSON PageBlockHorizontalAlignmentLeft {  } =
  A.object [ "@type" A..= T.String "pageBlockHorizontalAlignmentLeft" ]

 toJSON PageBlockHorizontalAlignmentCenter {  } =
  A.object [ "@type" A..= T.String "pageBlockHorizontalAlignmentCenter" ]

 toJSON PageBlockHorizontalAlignmentRight {  } =
  A.object [ "@type" A..= T.String "pageBlockHorizontalAlignmentRight" ]

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
    return $ PageBlockHorizontalAlignmentLeft {  }

   parsePageBlockHorizontalAlignmentCenter :: A.Value -> T.Parser PageBlockHorizontalAlignment
   parsePageBlockHorizontalAlignmentCenter = A.withObject "PageBlockHorizontalAlignmentCenter" $ \o -> do
    return $ PageBlockHorizontalAlignmentCenter {  }

   parsePageBlockHorizontalAlignmentRight :: A.Value -> T.Parser PageBlockHorizontalAlignment
   parsePageBlockHorizontalAlignmentRight = A.withObject "PageBlockHorizontalAlignmentRight" $ \o -> do
    return $ PageBlockHorizontalAlignmentRight {  }
 parseJSON _ = mempty
