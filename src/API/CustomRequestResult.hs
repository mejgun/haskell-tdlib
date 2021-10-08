-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CustomRequestResult where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains the result of a custom request 
-- 
-- __result__ A JSON-serialized result
data CustomRequestResult = 

 CustomRequestResult { result :: Maybe String }  deriving (Eq)

instance Show CustomRequestResult where
 show CustomRequestResult { result=result } =
  "CustomRequestResult" ++ cc [p "result" result ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CustomRequestResult where
 toJSON CustomRequestResult { result = result } =
  A.object [ "@type" A..= T.String "customRequestResult", "result" A..= result ]

instance T.FromJSON CustomRequestResult where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "customRequestResult" -> parseCustomRequestResult v
   _ -> mempty
  where
   parseCustomRequestResult :: A.Value -> T.Parser CustomRequestResult
   parseCustomRequestResult = A.withObject "CustomRequestResult" $ \o -> do
    result <- o A..:? "result"
    return $ CustomRequestResult { result = result }
 parseJSON _ = mempty
