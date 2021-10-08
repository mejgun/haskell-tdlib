-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateChatFilter where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatFilter as ChatFilter

-- |
-- 
-- Creates new chat filter. Returns information about the created chat filter 
-- 
-- __filter__ Chat filter
data CreateChatFilter = 

 CreateChatFilter { _filter :: Maybe ChatFilter.ChatFilter }  deriving (Eq)

instance Show CreateChatFilter where
 show CreateChatFilter { _filter=_filter } =
  "CreateChatFilter" ++ cc [p "_filter" _filter ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CreateChatFilter where
 toJSON CreateChatFilter { _filter = _filter } =
  A.object [ "@type" A..= T.String "createChatFilter", "filter" A..= _filter ]

instance T.FromJSON CreateChatFilter where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createChatFilter" -> parseCreateChatFilter v
   _ -> mempty
  where
   parseCreateChatFilter :: A.Value -> T.Parser CreateChatFilter
   parseCreateChatFilter = A.withObject "CreateChatFilter" $ \o -> do
    _filter <- o A..:? "filter"
    return $ CreateChatFilter { _filter = _filter }
 parseJSON _ = mempty
