-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageLinkInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about a public or private message link. Can be called for any internal link of the type internalLinkTypeMessage 
-- 
-- __url__ The message link
data GetMessageLinkInfo = 

 GetMessageLinkInfo { url :: Maybe String }  deriving (Eq)

instance Show GetMessageLinkInfo where
 show GetMessageLinkInfo { url=url } =
  "GetMessageLinkInfo" ++ cc [p "url" url ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetMessageLinkInfo where
 toJSON GetMessageLinkInfo { url = url } =
  A.object [ "@type" A..= T.String "getMessageLinkInfo", "url" A..= url ]

instance T.FromJSON GetMessageLinkInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageLinkInfo" -> parseGetMessageLinkInfo v
   _ -> mempty
  where
   parseGetMessageLinkInfo :: A.Value -> T.Parser GetMessageLinkInfo
   parseGetMessageLinkInfo = A.withObject "GetMessageLinkInfo" $ \o -> do
    url <- o A..:? "url"
    return $ GetMessageLinkInfo { url = url }
 parseJSON _ = mempty
