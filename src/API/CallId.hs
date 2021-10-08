-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallId where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains the call identifier 
-- 
-- __id__ Call identifier
data CallId = 

 CallId { _id :: Maybe Int }  deriving (Eq)

instance Show CallId where
 show CallId { _id=_id } =
  "CallId" ++ cc [p "_id" _id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CallId where
 toJSON CallId { _id = _id } =
  A.object [ "@type" A..= T.String "callId", "id" A..= _id ]

instance T.FromJSON CallId where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callId" -> parseCallId v
   _ -> mempty
  where
   parseCallId :: A.Value -> T.Parser CallId
   parseCallId = A.withObject "CallId" $ \o -> do
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CallId { _id = _id }
 parseJSON _ = mempty
