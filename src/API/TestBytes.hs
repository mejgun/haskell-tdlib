-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TestBytes where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- A simple object containing a sequence of bytes; for testing only 
-- 
-- __value__ Bytes
data TestBytes = 

 TestBytes { value :: Maybe String }  deriving (Eq)

instance Show TestBytes where
 show TestBytes { value=value } =
  "TestBytes" ++ cc [p "value" value ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestBytes where
 toJSON TestBytes { value = value } =
  A.object [ "@type" A..= T.String "testBytes", "value" A..= value ]

instance T.FromJSON TestBytes where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testBytes" -> parseTestBytes v
   _ -> mempty
  where
   parseTestBytes :: A.Value -> T.Parser TestBytes
   parseTestBytes = A.withObject "TestBytes" $ \o -> do
    value <- o A..:? "value"
    return $ TestBytes { value = value }
 parseJSON _ = mempty
