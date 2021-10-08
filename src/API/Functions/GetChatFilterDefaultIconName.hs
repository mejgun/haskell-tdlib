-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatFilterDefaultIconName where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatFilter as ChatFilter

-- |
-- 
-- Returns default icon name for a filter. Can be called synchronously 
-- 
-- __filter__ Chat filter
data GetChatFilterDefaultIconName = 

 GetChatFilterDefaultIconName { _filter :: Maybe ChatFilter.ChatFilter }  deriving (Eq)

instance Show GetChatFilterDefaultIconName where
 show GetChatFilterDefaultIconName { _filter=_filter } =
  "GetChatFilterDefaultIconName" ++ cc [p "_filter" _filter ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChatFilterDefaultIconName where
 toJSON GetChatFilterDefaultIconName { _filter = _filter } =
  A.object [ "@type" A..= T.String "getChatFilterDefaultIconName", "filter" A..= _filter ]

instance T.FromJSON GetChatFilterDefaultIconName where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatFilterDefaultIconName" -> parseGetChatFilterDefaultIconName v
   _ -> mempty
  where
   parseGetChatFilterDefaultIconName :: A.Value -> T.Parser GetChatFilterDefaultIconName
   parseGetChatFilterDefaultIconName = A.withObject "GetChatFilterDefaultIconName" $ \o -> do
    _filter <- o A..:? "filter"
    return $ GetChatFilterDefaultIconName { _filter = _filter }
 parseJSON _ = mempty
