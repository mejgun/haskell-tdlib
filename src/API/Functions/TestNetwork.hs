-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestNetwork where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Sends a simple network request to the Telegram servers; for testing only. Can be called before authorization
data TestNetwork = 

 TestNetwork deriving (Eq)

instance Show TestNetwork where
 show TestNetwork {  } =
  "TestNetwork" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestNetwork where
 toJSON TestNetwork {  } =
  A.object [ "@type" A..= T.String "testNetwork" ]

instance T.FromJSON TestNetwork where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testNetwork" -> parseTestNetwork v
   _ -> mempty
  where
   parseTestNetwork :: A.Value -> T.Parser TestNetwork
   parseTestNetwork = A.withObject "TestNetwork" $ \o -> do
    return $ TestNetwork {  }
 parseJSON _ = mempty
