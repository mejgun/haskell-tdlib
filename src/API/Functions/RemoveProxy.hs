-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveProxy where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Removes a proxy server. Can be called before authorization 
-- 
-- __proxy_id__ Proxy identifier
data RemoveProxy = 

 RemoveProxy { proxy_id :: Maybe Int }  deriving (Eq)

instance Show RemoveProxy where
 show RemoveProxy { proxy_id=proxy_id } =
  "RemoveProxy" ++ cc [p "proxy_id" proxy_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON RemoveProxy where
 toJSON RemoveProxy { proxy_id = proxy_id } =
  A.object [ "@type" A..= T.String "removeProxy", "proxy_id" A..= proxy_id ]

instance T.FromJSON RemoveProxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeProxy" -> parseRemoveProxy v
   _ -> mempty
  where
   parseRemoveProxy :: A.Value -> T.Parser RemoveProxy
   parseRemoveProxy = A.withObject "RemoveProxy" $ \o -> do
    proxy_id <- mconcat [ o A..:? "proxy_id", readMaybe <$> (o A..: "proxy_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ RemoveProxy { proxy_id = proxy_id }
 parseJSON _ = mempty
