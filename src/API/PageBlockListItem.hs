-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockListItem where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.PageBlock as PageBlock

-- |
-- 
-- Describes an item of a list page block 
-- 
-- __label__ Item label
-- 
-- __page_blocks__ Item blocks
data PageBlockListItem = 

 PageBlockListItem { page_blocks :: Maybe [PageBlock.PageBlock], label :: Maybe String }  deriving (Eq)

instance Show PageBlockListItem where
 show PageBlockListItem { page_blocks=page_blocks, label=label } =
  "PageBlockListItem" ++ cc [p "page_blocks" page_blocks, p "label" label ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON PageBlockListItem where
 toJSON PageBlockListItem { page_blocks = page_blocks, label = label } =
  A.object [ "@type" A..= T.String "pageBlockListItem", "page_blocks" A..= page_blocks, "label" A..= label ]

instance T.FromJSON PageBlockListItem where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pageBlockListItem" -> parsePageBlockListItem v
   _ -> mempty
  where
   parsePageBlockListItem :: A.Value -> T.Parser PageBlockListItem
   parsePageBlockListItem = A.withObject "PageBlockListItem" $ \o -> do
    page_blocks <- o A..:? "page_blocks"
    label <- o A..:? "label"
    return $ PageBlockListItem { page_blocks = page_blocks, label = label }
 parseJSON _ = mempty
