-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Ok where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- An object of this type is returned on a successful function call for certain functions
data Ok = 

 Ok deriving (Eq)

instance Show Ok where
 show Ok {  } =
  "Ok" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Ok where
 toJSON Ok {  } =
  A.object [ "@type" A..= T.String "ok" ]

instance T.FromJSON Ok where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "ok" -> parseOk v
   _ -> mempty
  where
   parseOk :: A.Value -> T.Parser Ok
   parseOk = A.withObject "Ok" $ \o -> do
    return $ Ok {  }
 parseJSON _ = mempty
